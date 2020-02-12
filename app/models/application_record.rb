class ApplicationRecord < ActiveRecord::Base
around_destroy :rescue_from_fk_destroy

def rescue_from_fk_destroy
  begin
    yield
  rescue ActiveRecord::InvalidForeignKey => e
    self.errors.add(self.class.model_name.human, " is still referenced in#{e.message.split("table").last.split('.').first.gsub(/\"/,'')}")
  end
end
  self.abstract_class = true
end