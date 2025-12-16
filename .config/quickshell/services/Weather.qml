pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

import "root:/Services/" as Services

Singleton {
    id: weatherman

    property string icon: ""
    property string location
    property string temperature_f
    property string dewpoint_f
    property string feelslike_f
    property string humdity

    property string pressure_mb
    property string uv
    property string visibility_mi

    property string wind_speed_mph
    property string wind_dir

    property string description: "Unknown"

    property var hourly_forecast: []

    component HourlyForcast: QtObject {
        id: hourlyForcastComponent
        required property var weather_json
        readonly property string time: weather_json.time
        readonly property real temp_f: { parseInt(weather_json.temp_F) }
        readonly property real condition: { 100 - parseInt(weather_json.chanceofremdry) }
    }

    component DailyForcast: QtObject {
        id: dailyForcastComponent
        required property var weather_json
        readonly property string date: weather_json.date
        readonly property real maxtemp_f: { parseInt(weather_json.maxtemp_F) }
        readonly property real mintemp_f: { parseInt(weather_json.mintemp_F) }
        readonly property string description: weather_json.weatherDesc[0].value
        readonly property real chance_of_rain: { parseInt(weather_json.chanceofrain) }
    }

    Process {
        id: weather_proc
        command: ["curl", "https://wttr.in/?format=j1"]
        running: true

        stdout: StdioCollector {
            waitForEnd: true

            onStreamFinished: {
                var json = JSON.parse(data);
                weatherman.location = `${json.nearest_area[0].areaName[0].value}, ${json.nearest_area[0].region[0].value}`;
                weatherman.temperature_f = json.current_condition[0].temp_F;
                weatherman.dewpoint_f = json.weather[0].hourly[0].DewPointF;
                weatherman.feelslike_f = json.current_condition[0].FeelsLikeF;
                weatherman.humdity = json.current_condition[0].humidity;

                weatherman.pressure_mb = json.current_condition[0].pressure;
                weatherman.uv = json.current_condition[0].uvIndex;
                weatherman.visibility_mi = json.current_condition[0].visibilityMiles;

                weatherman.wind_speed_mph = json.current_condition[0].windspeedMiles;
                weatherman.wind_dir = json.current_condition[0].winddir16Point;
                weatherman.description = json.current_condition[0].weatherDesc[0].value;

                // Calculate Icon
                weatherman.icon = Services.Icon.getWeatherIcon(json.current_condition[0].weatherCode)
            }
        }
    }

    Timer {
        id: weather_timer
        interval: 1000 * 60 * 60 // 1 hour
        repeat: true
        running: true
        onTriggered: {
            weather_proc.running = false;
            weather_proc.running = true;
        }
    }

    Component.onCompleted: {
        weather_proc.running = true;
    }
}