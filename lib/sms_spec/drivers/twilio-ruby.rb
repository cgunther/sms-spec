require 'twilio-ruby'

module Twilio
  module REST

    class Client
      def account
        Account.new(nil, self, sid: @account_sid)
      end
    end

    class Messages
      include SmsSpec::Helpers

      def create(opts={})
        to = opts[:to]
        body = opts[:body]
        from = opts[:from]
        add_message SmsSpec::Message.new(:number => to, :from => from, :body => body)
      end
    end

    class Account
      def sms
        Sms.new
      end

      def messages
        Messages.new
      end
    end

  end
end
