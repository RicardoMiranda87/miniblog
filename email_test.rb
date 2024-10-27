require 'net/smtp'

smtp = Net::SMTP.new 'smtp.office365.com', 587
smtp.enable_starttls
smtp.start('office365.com', 'authenticationricardo@outlook.com', 'Teste123@', :login) do
  smtp.send_message "Subject: Test Email\n\nThis is a test email.", 'authenticationricardo@outlook.com', 'ricardo.miranda@totalip.com.br'
end
