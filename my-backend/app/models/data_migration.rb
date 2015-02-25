class DataMigration
  include Mongoid::Document
  include Mongoid::Timestamps

  field :ip_address, type: String
  field :migrated, type: Boolean, default: false

  mount_uploader :backup, BackupUploader,  type: String

end
