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
      [0, 0, 32, pt, 0, pm.size, pm].pack("ccca*cca*")
    end
  
    def packaged_token
      [device_token.gsub(/[\s|<|>]/,'')].pack('H*')
    end
  
    def packaged_message
      aps = {'mdm'=> push_magic }
      aps.to_json
    end
    
  end
end

