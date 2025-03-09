class MbxBaseUrlVM {
  static String baseUrl = 'https://app.domain.id';

  static String apiUrl(String endpoint) {
    if (endpoint.toLowerCase().startsWith('http://') ||
        endpoint.toLowerCase().startsWith('https://')) {
      return endpoint;
    } else {
      return baseUrl + endpoint;
    }
  }
}
