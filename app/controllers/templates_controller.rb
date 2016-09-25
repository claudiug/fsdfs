class TemplatesController < ApplicationController

  def index
    @templates = Template.all
  end

  def new
    @template = Template.new
  end

  def create
    @template = Template.new(template_params)
    if @template.save
      values = get_values
      text = parse_template(@template.body, values)
      TemplateMailer.template_email(nil, text.html_safe).deliver_now
      redirect_to @template
    end
  end

  def send_emails
    @template = Template.find(params['id'])
    values = get_values
    text = parse_template(@template.body, values)
    TemplateMailer.template_email(nil, text.html_safe).deliver_now
    redirect_to @template
  end

  def template_params
    params.require(:template).permit(:body)
  end

  def show
    @template = Template.find(params['id'])
    @placeholders = @template.placeholders
  end

  def parse_template(text, values)
    values.each do |key, value|
      if value.kind_of?(Date)
        text = text.gsub "{#{key}}", value.strftime('%Y-%m-%d') unless text.blank?
      else
        text = text.gsub "{#{key}}", value unless text.blank? || value.blank?
      end
    end
    text
  end

  def get_values
    {
        user: 'claudiu',
        city: 'berlin',
        country: 'germany',
        price: '45 euro',
        level: '1'
    }
  end
end
