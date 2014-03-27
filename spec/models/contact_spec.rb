require 'spec_helper'

describe Contact do
  let(:valid_attrs) { { email: 'Sterling@isis.com', subject: 'spystuff', first_name: 'Sterling', last_name: 'Archer'} }

  describe 'validations' do
    context "when given valid attributes" do
      it "is valid" do
        contact = Contact.new(valid_attrs)
        expect(contact).to be_valid
      end
    end
  end

  it 'requires an email' do
    contact = Contact.new(valid_attrs.merge(email: ''))
    expect(contact).to_not be_valid
    expect(contact.errors[:email]).to include "can't be blank"
  end

    it 'requires a valid email' do
    contact = Contact.new(valid_attrs.merge(email: 'asdf'))
    expect(contact).to_not be_valid
    expect(contact.errors[:email]).to include "is invalid"
  end



  it 'requires a subject' do
    contact = Contact.new(valid_attrs.merge(subject: ''))
    expect(contact).to_not be_valid
    expect(contact.errors[:subject]).to include "can't be blank"
  end

  it 'requires a first name' do
    contact = Contact.new(valid_attrs.merge(first_name: ''))
    expect(contact).to_not be_valid
    expect(contact.errors[:first_name]).to include "can't be blank"
  end

  it 'requires a last name' do
    contact = Contact.new(valid_attrs.merge(last_name: ''))
    expect(contact).to_not be_valid
    expect(contact.errors[:last_name]).to include "can't be blank"
  end


end
