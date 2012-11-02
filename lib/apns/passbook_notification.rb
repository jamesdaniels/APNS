module APNS
  class PassbookNotification
    attr_accessor :device_token
    
    def initialize(device_token)
      self.device_token = device_token
    end
        
    def packaged_notification
      pt = self.packaged_token
      pm = self.packaged_message
      [1, 13, 1.day.from_now.to_i, 32, pt, pm.size, pm].pack("clNna*na*")
    end
  
    def packaged_token
      [device_token.gsub(/[\s|<|>]/,'')].pack('H*')
    end
  
    def packaged_message
      %({})
    end
    
  end
end


