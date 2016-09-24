class TemplateMailer < ApplicationMailer

  def template_email(user, template)
    @user = user
    @body = template
    mail(to: 'claudiu.garba@gmail.com',
         body: template,
         content_type: "text/html",
         subject: "Already rendered!")
  end
end
