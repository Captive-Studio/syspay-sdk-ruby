describe SyspaySDK::Requests::BillingAgreement do
  let(:subject) do
    described_class.new described_class::FLOW_API
  end

  it 'is a SyspaySDK::Requests::BaseClass' do
    is_expected.to be_a(SyspaySDK::Requests::BaseClass)
  end

  describe 'Constants' do
    it "has a FLOW_API class constant set to 'API'" do
      expect(described_class::FLOW_API).to eq('API')
    end

    it "has a FLOW_BUYER class constant set to 'BUYER'" do
      expect(described_class::FLOW_BUYER).to eq('BUYER')
    end

    it "has a FLOW_SELLER class constant set to 'SELLER'" do
      expect(described_class::FLOW_SELLER).to eq('SELLER')
    end

    it "has a MODE_BOTH class constant set to 'BOTH'" do
      expect(described_class::MODE_BOTH).to eq('BOTH')
    end

    it "has a MODE_ONLINE class constant set to 'ONLINE'" do
      expect(described_class::MODE_ONLINE).to eq('ONLINE')
    end

    it "has a MODE_TERMINAL class constant set to 'TERMINAL'" do
      expect(described_class::MODE_TERMINAL).to eq('TERMINAL')
    end

    it "has a METHOD_ASTROPAY_BANKTRANSFER class constant set to 'ASTROPAY_BANKTRANSFER'" do
      expect(described_class::METHOD_ASTROPAY_BANKTRANSFER).to eq('ASTROPAY_BANKTRANSFER')
    end

    it "has a METHOD_ASTROPAY_BOLETOBANCARIO class constant set to 'ASTROPAY_BOLETOBANCARIO'" do
      expect(described_class::METHOD_ASTROPAY_BOLETOBANCARIO).to eq('ASTROPAY_BOLETOBANCARIO')
    end

    it "has a METHOD_ASTROPAY_DEBITCARD class constant set to 'ASTROPAY_DEBITCARD'" do
      expect(described_class::METHOD_ASTROPAY_DEBITCARD).to eq('ASTROPAY_DEBITCARD')
    end

    it "has a METHOD_CLICKANDBUY class constant set to 'CLICKANDBUY'" do
      expect(described_class::METHOD_CLICKANDBUY).to eq('CLICKANDBUY')
    end

    it "has a METHOD_CREDITCARD class constant set to 'CREDITCARD'" do
      expect(described_class::METHOD_CREDITCARD).to eq('CREDITCARD')
    end

    it "has a METHOD_IDEAL class constant set to 'IDEAL'" do
      expect(described_class::METHOD_IDEAL).to eq('IDEAL')
    end

    it "has a METHOD_PAYSAFECARD class constant set to 'PAYSAFECARD'" do
      expect(described_class::METHOD_PAYSAFECARD).to eq('PAYSAFECARD')
    end

    it "has a METHOD_POSTFINANCE class constant set to 'POSTFINANCE'" do
      expect(described_class::METHOD_POSTFINANCE).to eq('POSTFINANCE')
    end

    it "has a METHOD class constant set to 'POST'" do
      expect(described_class::METHOD).to eq('POST')
    end

    it "has a PATH class constant set to '/api/v1/merchant/billing-agreement'" do
      expect(described_class::PATH).to eq('/api/v1/merchant/billing-agreement')
    end
  end

  describe 'Attributes' do
    it { is_expected.to respond_to(:flow) }
    it { is_expected.to respond_to(:mode) }
    it { is_expected.to respond_to(:payment_method) }
    it { is_expected.to respond_to(:threatmetrix_session_id) }
    it { is_expected.to respond_to(:billing_agreement) }
    it { is_expected.to respond_to(:ems_url) }
    it { is_expected.to respond_to(:redirect_url) }
    it { is_expected.to respond_to(:website) }
    it { is_expected.to respond_to(:agent) }
    it { is_expected.to respond_to(:allowed_retries) }
    it { is_expected.to respond_to(:payment) }
    it { is_expected.to respond_to(:customer) }
    it { is_expected.to respond_to(:creditcard) }
    it { is_expected.to respond_to(:bank_code) }
    it { is_expected.to respond_to(:reference) }
    it { is_expected.to respond_to(:currency) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:extra) }
  end

  describe 'Initialize' do
    it 'can only be called with a flow parameter' do
      billing_agreement = described_class.new described_class::FLOW_API
      expect(billing_agreement.flow).to eq(described_class::FLOW_API)
    end

    it 'raises a SyspaySDK::Exception::InvalidArgumentError' do
      expect do
        described_class.new 'test'
      end.to raise_error(SyspaySDK::Exceptions::InvalidArgumentError)
    end
  end

  describe '#http_method' do
    it 'returns the METHOD constant' do
      expect(subject.http_method).to eq(described_class::METHOD)
    end
  end

  describe '#path' do
    it 'returns the PATH constant' do
      expect(subject.path).to eq(described_class::PATH)
    end
  end

  describe '#build_response' do
    it 'raises a SyspaySDK::Exceptions::BadArgumentTypeError when anything but a hash is passed in' do
      expect do
        subject.build_response('test')
      end.to raise_error(SyspaySDK::Exceptions::BadArgumentTypeError)
    end

    it "raises a SyspaySDK::Exceptions::UnexpectedResponseError the hash doesn't contain the billing_agreement" do
      expect do
        subject.build_response(test: 'test')
      end.to raise_error(SyspaySDK::Exceptions::UnexpectedResponseError)
    end

    it 'returns an SyspaySDK::Entities::BillingAgreement' do
      expect(subject.build_response(billing_agreement: {})).to be_a(SyspaySDK::Entities::BillingAgreement)
    end

    let(:data) do
      {
        billing_agreement: { id: 137 },
        redirect: 'redirect'
      }
    end

    it 'returns a SyspaySDK::Entities::BillingAgreement setup according to data passed in' do
      billing_agreement = subject.build_response(data)
      expect(billing_agreement.id).to eq(data[:billing_agreement][:id])
      expect(billing_agreement.redirect).to eq(data[:redirect])
    end
  end

  describe '#data' do
    it 'returns a hash' do
      expect(subject.data).to be_a(Hash)
    end

    describe 'the returned hash' do
      it 'contains the flow' do
        subject.flow = described_class::FLOW_API
        expect(subject.data).to include(flow: described_class::FLOW_API)
      end

      it 'contains a boolean for the billing_agreement' do
        billing_agreement = SyspaySDK::Entities::BillingAgreement.build_from_response(id: 2)
        subject.billing_agreement = billing_agreement
        expect(subject.data).to include(billing_agreement: true)

        subject.billing_agreement = nil
        expect(subject.data).to include(billing_agreement: false)
      end

      it 'contains the mode' do
        subject.mode = described_class::MODE_BOTH
        expect(subject.data).to include(mode: described_class::MODE_BOTH)
      end

      it 'contains the threatmetrix_session_id' do
        subject.threatmetrix_session_id = 1
        expect(subject.data).to include(threatmetrix_session_id: 1)
      end

      it 'contains the method' do
        subject.payment_method = 'test'
        expect(subject.data).to include(method: 'test')
      end

      it 'contains the website' do
        subject.website = 'test'
        expect(subject.data).to include(website: 'test')
      end

      it 'contains the agent' do
        subject.agent = 'test'
        expect(subject.data).to include(agent: 'test')
      end

      it 'contains the redirect_url' do
        subject.redirect_url = 'test'
        expect(subject.data).to include(redirect_url: 'test')
      end

      it 'contains the ems_url' do
        subject.ems_url = 'test'
        expect(subject.data).to include(ems_url: 'test')
      end

      it 'contains a hash for the creditcard' do
        creditcard = SyspaySDK::Entities::CreditCard.new
        creditcard.number = 159
        subject.creditcard = creditcard
        expect(subject.data).to include(creditcard: creditcard.to_hash)
      end

      it 'contains a hash for the customer' do
        customer = SyspaySDK::Entities::Customer.new
        customer.email = 'test'
        subject.customer = customer
        expect(subject.data).to include(customer: customer.to_hash)
      end

      it 'contains the bank_code' do
        subject.bank_code = 'test'
        expect(subject.data).to include(bank_code: 'test')
      end

      it 'contains the reference' do
        subject.reference = 'test'
        expect(subject.data).to include(reference: 'test')
      end

      it 'contains the currency' do
        subject.currency = 'test'
        expect(subject.data).to include(currency: 'test')
      end

      it 'contains the description' do
        subject.description = 'test'
        expect(subject.data).to include(description: 'test')
      end

      it 'contains the allowed_retries' do
        subject.allowed_retries = 'test'
        expect(subject.data).to include(allowed_retries: 'test')
      end

      it 'contains the extra' do
        subject.extra = 'test'
        expect(subject.data).to include(extra: 'test')
      end
    end
  end
end
