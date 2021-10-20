require 'rails_helper'

RSpec.describe 'cast poro' do
  it 'exists and has attributes' do
    cast_member = Cast.new(name: "Macaulay Culkin", character: "Kevin McCallister")

    expect(cast_member).to be_a(Cast)
    expect(cast_member.name).to eq("Macaulay Culkin")
    expect(cast_member.role).to eq("Kevin McCallister")
  end
end
