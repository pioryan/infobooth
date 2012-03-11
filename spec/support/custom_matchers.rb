def validates_presence_of(column)
  model = described_class.create
  model.valid?
  model.should have(1).errors_on(column)
  model.error_on(column).should include("can't be blank")
end

def validates_uniqueness_of(column)
  described_class.validators_on(column).to_s.should =~ /UniquenessValidator/
end
