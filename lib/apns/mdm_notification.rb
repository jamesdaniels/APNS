module APNS
  class MdmNotification
    attr_accessor :push_magic, :device_token
    
    def initialize(device_token, push_magic)
      self.device_token = device_token
			self.push_magic = push_magic
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
      %({"mdm":"#{push_magic}"})
    end
    
  end
end

