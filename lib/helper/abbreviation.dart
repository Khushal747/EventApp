class CountryAbbreviationHelper {
  static final Map<String, String> _countryAbbreviations = {
    'United States': 'US',
    'Canada': 'CA',
    'Netherlands': 'NL',
    'Germany': 'DE',
    'Singapore': 'SG',
    'India': 'IN',
    'France': 'FR',
    'Japan': 'JP',
    // Add more country mappings as needed
  };

  static String getAbbreviation(String countryName) {
    // Convert the country name to title case for better matching
    String formattedCountryName = countryName
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');

    // Look up the abbreviation in the map
    String? abbreviation = _countryAbbreviations[formattedCountryName];

    // If no abbreviation is found, return the original name
    return abbreviation ?? countryName;
  }
}
