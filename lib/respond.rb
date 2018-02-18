module Josh

  class Respond < Messages

    ##
    # set status code of respond
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @param [Integer] code
    # @return [Object]
    def set_status_code(code)
      @code = code
      self
    end

    ##
    # set status text of respond
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @param [String] text
    # @return [Object]
    def set_status_text(text)
      @text = I18n.t text
      self
    end

    ##
    # get respond with message
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @param [String] message
    # @return [Object]
    def respond_with_message(message = nil)
      result = { :status => @text , :message => message }

      if message == nil
        result['message'] = @error[:message]
      end

      if @error_code
        result['error'] = @error_code
      end

      { :json => result, status: @code, headers: @headers }
    end

    ##
    # get respond with result
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @param [array] data
    # @return [Object]
    def respond_with_result(data)

      { :json => { :status => @text, :result => data }, status: @code, headers: @headers }
    end

    ##
    # set error code and get details from lang file
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @param [Integer] error_code
    # @return [Object]
    def set_error_code(error_code)
      @error_code = error_code
      @error = I18n.t "respond.#{error_code}"
      self
    end

    ##
    # set headers for response
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @param [Object] headers
    # @return [Object]
    def set_headers(headers)
      @headers = headers
    end

  end

end