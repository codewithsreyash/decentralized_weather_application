module MyModule::DecentralizedWeather {
    use aptos_framework::signer;

    /// Struct representing a weather report.
    struct WeatherReport has store, key {
        location: address, // Location identifier
        temperature: u64,  // Current temperature (changed from i64 to u64)
    }

    /// Function to create a new weather report for a location.
    public fun create_weather_report(owner: &signer, location: address, temperature: u64) {
        let report = WeatherReport {
            location,
            temperature,
        };
        move_to(owner, report);
    }

    /// Function to update the temperature of a weather report.
    public fun update_temperature(owner: &signer, new_temperature: u64) acquires WeatherReport {
        let report = borrow_global_mut<WeatherReport>(signer::address_of(owner));
        report.temperature = new_temperature;
    }
}