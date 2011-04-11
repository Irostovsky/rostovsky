class Message < ActiveRecord::Base
  validates_presence_of :code, :body
  validates_uniqueness_of :code
  @@default_message_hash = YAML::load(File.open("#{RAILS_ROOT}/config/locales/ru.yml"))["ru"]["messages"]

  def self.all_items
    all_items_hash.values
  end

  def self.all_items_hash
    hash_all = all.inject({}){|hash, item| hash[item.code] = item; hash;}
    default_messages.merge hash_all
  end

  def self.find_item_by_code code
    self.find_by_code(code) || default_messages[code]
  end

  def self.body code
    find_item_by_code(code).body
  end
  
  def self.default_messages
    res = {}
    default_message_hash.each do |code, body|
      res[code] = Message.new :code => code, :body => body
    end
    res
  end

  def self.default_message_hash
    @@default_message_hash
  end
end
