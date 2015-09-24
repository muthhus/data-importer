require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'mysql',
  :database => 'YourDBNam',
  :username => 'YourDBUserName',
  :password => 'YourDBPassword',
  :encoding => 'utf8',
  :host => 'localhost'
  )
module MGageDataImport
  class Campaign < ActiveRecord::Base
  end
  
  unless Campaign.table_exists?
    ActiveRecord::Schema.define do
      create_table :campaigns do |t|
        t.string :result_type
        t.bigint :epoch_time
        t.string :campaign
        t.string :validity
        t.string :choice
      end
    end
  end
  
end