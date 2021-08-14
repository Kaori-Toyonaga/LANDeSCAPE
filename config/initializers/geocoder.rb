Geocoder.configure(
  lookup: :google,
  always_raise: [
    Geocoder::OverQueryLimitError,
    Geocoder::RequestDenied,
    Geocoder::InvalidRequest,
    Geocoder::InvalidApiKey
  ],
  use_https: true,
  api_key: ENV['GOOGLE_MAP_API_KEY']
)
