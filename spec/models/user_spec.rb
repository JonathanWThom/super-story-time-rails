require 'rails_helper'

describe User do
  it { should validate_presence_of :name }
  it { should have_many(:stories).through(:contributions)}
  it { should have_secure_password }
end
