require 'mechanize'
current_rep = 0.0
# :first_in sets how long it takes before the job is first run.
# In this case, it is run immediately
SCHEDULER.every '1m', :first_in => 0 do |job|
  send_event('email-reputation', { current: get_email_reputation.to_f })
end

def get_email_reputation
  sendgrid = Mechanize.new
  login_page = sendgrid.get("https://sendgrid.com/marketing/login")
  form = login_page.form_with(:action => "https://sendgrid.com/login")
  form.fields[0].value = ENV["SENDGRID_USERNAME"]
  form.fields[1].value = ENV["SENDGRID_PASSWORD"]
  account_page = form.submit
  account_page.search("#reputation-score").text.chop
end
