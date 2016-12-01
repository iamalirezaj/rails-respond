module Anetwork

  class Messages

    # setter and getter varibules
    attr_accessor :code , :text , :error , :error_code , :headers , :lang , :config

    ##
    # initialize method
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @return [Object]
    # @param [String] lang
    def initialize(lang = 'en')
      @lang = I18n.locale

      if @lang != '' || @lang != nil
        lang = @lang
      end

      @config = eval(File.open(__dir__ + "/errors/#{lang}.rb").read)
    end

    ##
    # Request succeeded and contains json result
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @param [Object] data
    # @return [Object]
    def succeed(data)
      self.set_status_code(200)
          .set_status_text('success')
          .respond_with_result(data)
    end

    ##
    # Delete action is succeed
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @param [String] message
    # @return [Object]
    def delete_succeeded(message = nil)
      if message == nil
        message = @config[:success][:delete]
      end

      self.set_status_code(200)
          .set_status_text('success')
          .respond_with_message(message)
    end

    ##
    # Update action is succeed
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @param [String] message
    # @return [Object]
    def update_succeeded(message = nil)
      if message == nil
        message = @config[:success][:update]
      end

      self.set_status_code(200)
          .set_status_text('success')
          .respond_with_message(message)
    end

    ##
    # Insert action is succeed
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @param [String] message
    # @return [Object]
    def insert_succeeded(message = nil)
      if message == nil
        message = @config[:success][:insert]
      end

      self.set_status_code(200)
          .set_status_text('success')
          .respond_with_message(message)
    end

    ##
    # Delete action is faild
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @param [String] message
    # @return [Object]
    def delete_faild(message = nil)
      if message == nil
        message = @config[:fail][:delete]
      end

      self.set_status_code(447)
          .set_status_text('fail')
          .set_error_code(5447)
          .respond_with_message(message)
    end

    ##
    # Update action is succeed
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @param [String] message
    # @return [Object]
    def update_faild(message = nil)
      if message == nil
        message = @config[:fail][:update]
      end

      self.set_status_code(449)
          .set_status_text('fail')
          .set_error_code(5449)
          .respond_with_message(message)
    end

    ##
    # Insert action is faild
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @param [String] message
    # @return [Object]
    def insert_faild(message = nil)
      if message == nil
        message = @config[:fail][:insert]
      end

      self.set_status_code(448)
          .set_status_text('fail')
          .set_error_code(5448)
          .respond_with_message(message)
    end

    ##
    # Database connection is refused
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @return [Object]
    def connection_refused
      self.set_status_code(445)
          .set_status_text('fail')
          .set_error_code(5445)
          .respond_with_message
    end

    ##
    # Page requested is not found
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @return [Object]
    def not_found
      self.set_status_code(404)
          .set_status_text('fail')
          .set_error_code(5404)
          .respond_with_message
    end

    ##
    # Wrong parameters are entered
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @return [Object]
    def wrong_parameters
      self.set_status_code(406)
          .set_status_text('fail')
          .set_error_code(5406)
          .respond_with_message
    end

    ##
    # Method is not allowed
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @return [Object]
    def method_not_allowed
      self.set_status_code(405)
          .set_status_text('fail')
          .set_error_code(5405)
          .respond_with_message
    end

    ##
    # There ara validation errors
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @return [Object]
    def validation_errors(message = nil)
      self.set_status_code(420)
          .set_status_text('fail')
          .set_error_code(5420)
          .respond_with_message(message)
    end

    ##
    # The request field is not found
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @return [Object]
    def request_field_notfound
      self.set_status_code(446)
          .set_status_text('fail')
          .set_error_code(1001)
          .respond_with_message
    end

    ##
    # The request field is duplicated
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @return [Object]
    def request_field_duplicated
      self.set_status_code(400)
          .set_status_text('fail')
          .set_error_code(1004)
          .respond_with_message
    end

    ##
    # The error message
    #
    # @author Alireza Josheghani <a.josheghani@anetwork.ir>
    # @since 1 Dec 2016
    # @param [Object] code
    # @return [Object]
    def error(code)
      self.set_status_code(400)
          .set_status_text('fail')
          .set_error_code(code)
          .respond_with_message
    end

  end

end

