class ContactMailer < ApplicationMailer
	default from: "info@blackbirdband.net"

	def contact_email
		@name = params[:name]
		@email = params[:email]
		@message = params[:message]

		mail(to: 'glredig+bbcontact@gmail.com', subject: "Web Contact Form", content_type: "text/plain", message: @message, name: @name)
	end
end
