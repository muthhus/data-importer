module MGageDataImport
  class DataImporter
    
    def send_vote locFileName
      File.open(locFileName).readlines.each do |line|
        arr_campaign = line.split(nil, 9)
        if arr_campaign.size == 9
          result_type, epoch_time, campaign, validity, choice = arr_campaign[0], arr_campaign[1], arr_campaign[2].split(':')[1], arr_campaign[3].split(':')[1], arr_campaign[4].split(':')[1]
          if /[A-Za-z]/.match(result_type) && /[0-9]/.match(epoch_time) && /[a-zA-Z0-9_]/.match(campaign) && /[A-Z]/i.match(validity) && /[a-z]/i.match(choice)
            unless MGageDataImport::Campaign.table_exists?
              @campaign = MGageDataImport::Campaign.new
              @campaign.result_type = result_type
              @campaign.epoch_time = epoch_time
              @campaign.campaign = campaign
              @campaign.validity = validity
              @campaign.choice = choice
              @campaign.save!
            end
          end
        end
          
      end
    end
    
  end
end