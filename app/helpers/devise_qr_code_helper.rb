# frozen_string_literal: true

module DeviseQrCodeHelper
  def qr_code_for_devise(resource)
    token = "otpauth://totp/#{resource.email}?secret=#{resource.otp_auth_secret}&issuer=MyApp"

    qrcode = ::RQRCode::QRCode.new(token)

    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ::ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 250
    )

    "data:image/png;base64,#{Base64.strict_encode64(png.to_blob)}"
  end
end
