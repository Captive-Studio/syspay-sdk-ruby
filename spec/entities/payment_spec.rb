require 'spec_helper'

describe SyspaySDK::Entities::Payment do
  it "is a SyspaySDK::Entities::ReturnedEntity" do
    subject.should be_a(SyspaySDK::Entities::ReturnedEntity)
  end

  describe "Constants" do
    it "has a TYPE class constant set to 'payment'" do
      SyspaySDK::Entities::Payment::TYPE.should eq('payment')
    end

    it "has a FAILURE_CARD_FLAGGED class constant set to 'card_flagged'" do
      SyspaySDK::Entities::Payment::FAILURE_CARD_FLAGGED.should eq('card_flagged')
    end

    it "has a FAILURE_DECLINED class constant set to 'declined'" do
      SyspaySDK::Entities::Payment::FAILURE_DECLINED.should eq('declined')
    end

    it "has a FAILURE_DUPLICATED class constant set to 'duplicated'" do
      SyspaySDK::Entities::Payment::FAILURE_DUPLICATED.should eq('duplicated')
    end

    it "has a FAILURE_EXPIRED class constant set to 'expired'" do
      SyspaySDK::Entities::Payment::FAILURE_EXPIRED.should eq('expired')
    end

    it "has a FAILURE_FRAUD class constant set to 'fraud_suspicious'" do
      SyspaySDK::Entities::Payment::FAILURE_FRAUD.should eq('fraud_suspicious')
    end

    it "has a FAILURE_INSUFFICIENT_FUNDS class constant set to 'insufficient_funds'" do
      SyspaySDK::Entities::Payment::FAILURE_INSUFFICIENT_FUNDS.should eq('insufficient_funds')
    end

    it "has a FAILURE_INVALID_CARD class constant set to 'invalid_card'" do
      SyspaySDK::Entities::Payment::FAILURE_INVALID_CARD.should eq('invalid_card')
    end

    it "has a FAILURE_INVALID_CV2 class constant set to 'invalid_cv2'" do
      SyspaySDK::Entities::Payment::FAILURE_INVALID_CV2.should eq('invalid_cv2')
    end

    it "has a FAILURE_INVALID_DETAILS class constant set to 'invalid_details'" do
      SyspaySDK::Entities::Payment::FAILURE_INVALID_DETAILS.should eq('invalid_details')
    end

    it "has a FAILURE_OTHER class constant set to 'other'" do
      SyspaySDK::Entities::Payment::FAILURE_OTHER.should eq('other')
    end

    it "has a FAILURE_TECHNICAL_ERROR class constant set to 'technical_error'" do
      SyspaySDK::Entities::Payment::FAILURE_TECHNICAL_ERROR.should eq('technical_error')
    end

    it "has a FAILURE_UNSUPPORTED class constant set to 'unsupported'" do
      SyspaySDK::Entities::Payment::FAILURE_UNSUPPORTED.should eq('unsupported')
    end
  end

  describe "Attributes" do
    it { should respond_to(:id) }
    it { should respond_to(:status) }
    it { should respond_to(:chip_and_pin_status) }
    it { should respond_to(:failure_category) }
    it { should respond_to(:reference) }
    it { should respond_to(:amount) }
    it { should respond_to(:currency) }
    it { should respond_to(:description) }
    it { should respond_to(:extra) }
    it { should respond_to(:preauth) }
    it { should respond_to(:website) }
    it { should respond_to(:billing_agreement) }
    it { should respond_to(:subscription) }
    it { should respond_to(:redirect) }
    it { should respond_to(:processing_time) }
    it { should respond_to(:recipient_map) }
    it { should respond_to(:payment_type) }
    it { should respond_to(:website_url) }
    it { should respond_to(:contract) }
    it { should respond_to(:descriptor) }
    it { should respond_to(:account_id) }
    it { should respond_to(:merchant_login) }
    it { should respond_to(:merchant_id) }
    it { should respond_to(:settlement_date) }
    it { should respond_to(:payment_method) }
  end

  it "responds to ::build_from_response" do
    SyspaySDK::Entities::Payment.should respond_to(:build_from_response)
  end

  describe "::build_from_response" do
    it "doesn't raise an error when called" do
      lambda do
        SyspaySDK::Entities::Payment.build_from_response({ test: "test" })
      end.should_not raise_error
    end

    it "returns a Payment object" do
      SyspaySDK::Entities::Payment.build_from_response({ test: "test" }).should be_a(SyspaySDK::Entities::Payment)
    end

    it "raises a SyspaySDK::Exceptions::BadArgumentTypeError when anything but a hash is passed in" do
      lambda do
        SyspaySDK::Entities::Payment.build_from_response("test")
      end.should raise_error(SyspaySDK::Exceptions::BadArgumentTypeError)
    end

    let (:response) do
      {
        id: "id",
        reference: "reference",
        amount: "amount",
        currency: "currency",
        status: "status",
        extra: "extra",
        description: "description",
        website: "website",
        failure_category: "failure_category",
        chip_and_pin_status: "chip_and_pin_status",
        payment_type: "payment_type",
        website_url: "website_url",
        contract: "contract",
        descriptor: "descriptor",
        account_id: "account_id",
        merchant_login: "merchant_login",
        merchant_id: "merchant_id"
      }
    end

    before(:each) do
      @payment = SyspaySDK::Entities::Payment.build_from_response(response)
    end

    it "sets instance raw attribute to response" do
      @payment.raw.should eq(response)
    end

    it "sets instance id attribute using value in response" do
      @payment.id.should eq(response[:id])
    end

    it "sets instance reference attribute using value in response" do
      @payment.reference.should eq(response[:reference])
    end

    it "sets instance amount attribute using value in response" do
      @payment.amount.should eq(response[:amount])
    end

    it "sets instance currency attribute using value in response" do
      @payment.currency.should eq(response[:currency])
    end

    it "sets instance status attribute using value in response" do
      @payment.status.should eq(response[:status])
    end

    it "sets instance extra attribute using value in response" do
      @payment.extra.should eq(response[:extra])
    end

    it "sets instance description attribute using value in response" do
      @payment.description.should eq(response[:description])
    end

    it "sets instance website attribute using value in response" do
      @payment.website.should eq(response[:website])
    end

    it "sets instance failure_category attribute using value in response" do
      @payment.failure_category.should eq(response[:failure_category])
    end

    it "sets instance chip_and_pin_status attribute using value in response" do
      @payment.chip_and_pin_status.should eq(response[:chip_and_pin_status])
    end

    it "sets instance payment_type attribute using value in response" do
      @payment.payment_type.should eq(response[:payment_type])
    end

    it "sets instance website_url attribute using value in response" do
      @payment.website_url.should eq(response[:website_url])
    end

    it "sets instance contract attribute using value in response" do
      @payment.contract.should eq(response[:contract])
    end

    it "sets instance descriptor attribute using value in response" do
      @payment.descriptor.should eq(response[:descriptor])
    end

    it "sets instance account_id attribute using value in response" do
      @payment.account_id.should eq(response[:account_id])
    end

    it "sets instance merchant_login attribute using value in response" do
      @payment.merchant_login.should eq(response[:merchant_login])
    end

    it "sets instance merchant_id attribute using value in response" do
      @payment.merchant_id.should eq(response[:merchant_id])
    end

    it "sets instance settlement_date attribute using value in response" do
      settlement_date = DateTime.new(2001,2,3)
      response[:settlement_date] = settlement_date.to_time.to_i
      SyspaySDK::Entities::Payment.build_from_response(response).settlement_date.should eq(settlement_date)
    end

    it "sets instance processing_time attribute using value in response" do
      processing_time = DateTime.new(2001,2,3)
      response[:processing_time] = processing_time.to_time.to_i
      SyspaySDK::Entities::Payment.build_from_response(response).processing_time.should eq(processing_time)
    end

    it "sets instance billing_agreement attribute using value in response"

    it "sets instance subscription attribute using value in response"

    it "sets instance payment_method attribute using value in response"
  end

  it "responds to #set_recipient_map" do
    subject.should respond_to(:set_recipient_map)
  end

  describe "#set_recipient_map" do
    it "sets the instance recipient_map attribute properly" do
      recipient_map = [SyspaySDK::Entities::PaymentRecipient.new, SyspaySDK::Entities::PaymentRecipient.new]
      subject.set_recipient_map(recipient_map)

      subject.recipient_map.should eq(recipient_map)
    end

    it "raises a SyspaySDK::Exceptions::BadArgumentTypeError when recipient_map doesn't contain only PaymentRecipient" do
      recipient_map = [SyspaySDK::Entities::PaymentRecipient.new, SyspaySDK::Entities::Payment.new]

      lambda do
        subject.set_recipient_map(recipient_map)
      end.should raise_error(SyspaySDK::Exceptions::BadArgumentTypeError)
    end
  end

  it "responds to #add_recipient" do
    subject.should respond_to(:add_recipient)
  end

  describe "#add_recipient" do
    it "adds a recipient to the instance recipient_map array" do
      recipient = SyspaySDK::Entities::PaymentRecipient.new
      subject.add_recipient recipient
      subject.recipient_map.should include(recipient)
    end

    it "raises a SyspaySDK::Exceptions::BadArgumentTypeError when recipient is not a PaymentRecipient" do
      recipient = "Not a PaymentRecipient"

      lambda do
        subject.add_recipient recipient
      end.should raise_error(SyspaySDK::Exceptions::BadArgumentTypeError)
    end
  end


  it "responds to #to_hash" do
    subject.should respond_to(:to_hash)
  end

  describe "#to_hash" do
    let (:response) do
      {
        id: "id",
        reference: "reference",
        amount: "amount",
        currency: "currency",
        status: "status",
        extra: "extra",
        description: "description",
        website: "website",
        failure_category: "failure_category",
        chip_and_pin_status: "chip_and_pin_status",
        payment_type: "payment_type",
        website_url: "website_url",
        contract: "contract",
        descriptor: "descriptor",
        account_id: "account_id",
        merchant_login: "merchant_login",
        merchant_id: "merchant_id"
      }
    end

    let(:subject) {
      SyspaySDK::Entities::Payment.build_from_response(response)
    }

    it "returns the payment converted to a hash" do
      subject.to_hash.should include(reference: response[:reference])
      subject.to_hash.should include(amount: response[:amount])
      subject.to_hash.should include(currency: response[:currency])
      subject.to_hash.should include(description: response[:description])
      subject.to_hash.should include(extra: response[:extra])
      subject.to_hash.should include(preauth: response[:preauth])
      subject.to_hash[:recipients].should eq([])
    end

    it 'should include the recipients with one hash per recipient' do
      recipient1 = SyspaySDK::Entities::PaymentRecipient.new
      recipient2 = SyspaySDK::Entities::PaymentRecipient.new
      recipients_map = [recipient1, recipient2]

      subject.set_recipient_map recipients_map

      subject.to_hash[:recipients].should include(recipient1.to_hash)
      subject.to_hash[:recipients].should include(recipient2.to_hash)
    end
  end
end

#     public static function buildFromResponse(stdClass $response)
#     {
#         if (isset($response->billing_agreement)
#                 && ($response->billing_agreement instanceof stdClass)) {
#             $billingAgreement =
#                 Syspay_Merchant_Entity_BillingAgreement::buildFromResponse($response->billing_agreement);
#             $payment->setBillingAgreement($billingAgreement);
#         }
#         if (isset($response->subscription)
#                 && ($response->subscription instanceof stdClass)) {
#             $subscription = Syspay_Merchant_Entity_Subscription::buildFromResponse($response->subscription);
#             $payment->setSubscription($subscription);
#         }
#         if (isset($response->payment_method)
#                 && ($response->payment_method instanceof stdClass)) {
#             $paymentMethod = Syspay_Merchant_Entity_PaymentMethod::buildFromResponse($response->payment_method);
#             $payment->setPaymentMethod($paymentMethod);
#         }
#     }
