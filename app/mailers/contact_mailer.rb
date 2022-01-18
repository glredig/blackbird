class ContactMailer < ApplicationMailer
	default from: "info@blackbirdband.net"

	def contact_email(name, email, message)
		@name = name
		@email = 'glredig@gmail.com'
		@message = message

		mail(to: @email, subject: "Web Contact Form", content_type: "text/plain", message: @message, name: @name)
	end
end
