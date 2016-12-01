require 'Messages'

module Anetwork

  class Respond < Messages

    def set_status_code(code)
      @code = code
      self
    end

    def set_status_text(text)
      @text = text
      self
    end

    def respond_with_message(message = nil)
      result = { :status => @text , :message => message }

      if message == nil
        result['message'] = @error[:message]
      end

      if @error_code
        result['error'] = @error_code
      end

      result
    end

    def respond_with_result(data)
      { :status => @text, :result => data }
    end

    def set_error_code(error_code)
      @error_code = error_code
      @error = @config[error_code]
      self
    end

    def set_headers(headers)
      @headers = headers
    end

  end

end