package com.alexeenkoff.daily_mobile_app

import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import android.hardware.SensorManager.SENSOR_DELAY_FASTEST
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugins.GeneratedPluginRegistrant


internal class StreamHandlerImpl(private val sensorManager: SensorManager, sensorType: Int) : EventChannel.StreamHandler {
    private var sensorEventListener: SensorEventListener? = null
    private val sensor: Sensor = sensorManager.getDefaultSensor(sensorType)

    override fun onListen(arguments: Any?, events: EventSink) {
        sensorEventListener = createSensorEventListener(events)
        sensorManager.registerListener(sensorEventListener, sensor, SENSOR_DELAY_FASTEST)
    }

    override fun onCancel(arguments: Any) {
        sensorManager.unregisterListener(sensorEventListener)
    }

    fun createSensorEventListener(events: EventSink): SensorEventListener {
        return object : SensorEventListener {
            override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {}
            override fun onSensorChanged(event: SensorEvent) {
                val sensorValues = DoubleArray(event.values.size)
                for (i in event.values.indices) {
                    sensorValues[i] = event.values[i].toDouble()
                }
                events.success(sensorValues)
            }
        }
    }

}

class MainActivity : FlutterActivity() {
    private val MAGNETOMETER_CHANNEL_NAME = "mobile.daily.dev/magnetometer"
    private lateinit var magnetometerChannel: EventChannel

    fun configureMagnetometer(flutterEngine: FlutterEngine) {
        magnetometerChannel = EventChannel(flutterEngine.dartExecutor.binaryMessenger, MAGNETOMETER_CHANNEL_NAME)
        magnetometerChannel.setStreamHandler(StreamHandlerImpl(
                context.getSystemService(Context.SENSOR_SERVICE) as SensorManager,
                Sensor.TYPE_MAGNETIC_FIELD
        ))
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        configureMagnetometer(flutterEngine)
    }

    override fun onDetachedFromWindow() {
        super.onDetachedFromWindow()
        magnetometerChannel.setStreamHandler(null)
    }
}
