require 'rails_helper'

RSpec.describe User, tyoe: :model do
  subject { User.new(name: 'Lenny', email: 'lenny@mail.com', password: '1234567') }

  before { subject.save }

  it 'should validate user' do
    expect(subject).to be_valid
    subject.name = ''
    expect(subject).to_not be_valid
  end
end
