module Anetwork

  class Messages

    attr_accessor :code , :text , :error , :error_code , :headers , :lang , :config

    def initialize
      @lang = I18n.locale
      lang = 'en'

      if @lang != '' || @lang != nil
        lang = @lang
      end

      @config = eval(File.open(Rails.root.join(
          'config/respond/errors', "#{lang}.rb"
      )).read)
    end

    def succeed(data)
      self.set_status_code(200)
          .set_status_text('success')
          .respond_with_result(data)
    end

    def delete_succeeded(message = nil)
      if message == nil
        message = @config[:success][:delete]
      end

      self.set_status_code(200)
          .set_status_text('success')
          .respond_with_message(message)
    end

    def update_succeeded(message = nil)
      if message == nil
        message = @config[:success][:update]
      end

      self.set_status_code(200)
          .set_status_text('success')
          .respond_with_message(message)
    end

    def insert_succeeded(message = nil)
      if message == nil
        message = @config[:success][:insert]
      end

      self.set_status_code(200)
          .set_status_text('success')
          .respond_with_message(message)
    end

    def delete_faild(message = nil)
      if message == nil
        message = @config[:fail][:delete]
      end

      self.set_status_code(447)
          .set_status_text('fail')
          .set_error_code(5447)
          .respond_with_message(message)
    end

    def update_faild(message = nil)
      if message == nil
        message = @config[:fail][:update]
      end

      self.set_status_code(449)
          .set_status_text('fail')
          .set_error_code(5449)
          .respond_with_message(message)
    end

    def insert_faild(message = nil)
      if message == nil
        message = @config[:fail][:insert]
      end

      self.set_status_code(448)
          .set_status_text('fail')
          .set_error_code(5448)
          .respond_with_message(message)
    end

    def connection_refused

      self.set_status_code(445)
          .set_status_text('fail')
          .set_error_code(5445)
          .respond_with_message()
    end

    def not_found

      self.set_status_code(404)
          .set_status_text('fail')
          .set_error_code(5404)
          .respond_with_message
    end

    def wrong_parameters

      self.set_status_code(406)
          .set_status_text('fail')
          .set_error_code(5406)
          .respond_with_message
    end

    def method_not_allowed

      self.set_status_code(405)
          .set_status_text('fail')
          .set_error_code(5405)
          .respond_with_message
    end

    def validation_errors(message = nil)

      self.set_status_code(420)
          .set_status_text('fail')
          .set_error_code(5420)
          .respond_with_message(message)
    end

    def request_field_notfound

      self.set_status_code(446)
          .set_status_text('fail')
          .set_error_code(1001)
          .respond_with_message
    end

    def request_field_duplicated

      self.set_status_code(400)
          .set_status_text('fail')
          .set_error_code(1004)
          .respond_with_message
    end

    def error(code)

      self.set_status_code(400)
          .set_status_text('fail')
          .set_error_code(code)
          .respond_with_message
    end

  end

end

