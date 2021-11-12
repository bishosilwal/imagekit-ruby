module CarrierWave
    module Storage
      class IKFile
        # Initialize as required.
        
        def initialize(identifier)
          @identifier=JSON.parse(identifier)
          ik_config=Rails.application.config.imagekit
          @imagekit=ImageKitIo::Client.new(ik_config[:private_key], ik_config[:public_key], ik_config[:url_endpoint])
        end

        # Duck-type methods for CarrierWave::SanitizedFile. 
        def content_type
            "image/jpg"
        end
        def public_url
          @identifier['url']
        end
        def url(options = {})
          @identifier['url']
        end

        def fileId
          @identifier['fileId']
        end
        def filename(options = {})
          @identifier['name']
        end
        def read
        end
        def size
        end
        def delete
          # file_id=@identifier['fileId']
          begin
            @imagekit.delete_file(fileId)
          rescue
            fileId
          end
          # binding.pry
          # return nil
        end
        def exists?
        end
        # Others... ?
      end

    end

end
