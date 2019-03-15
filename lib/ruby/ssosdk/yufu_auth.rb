module Ssosdk
  require_relative '../../../lib/ruby/ssosdk/token/rsa_token_generator'
  require_relative '../../../lib/ruby/ssosdk/token/rsa_token_verifier'
  class YufuAuth

    @tokenVerifier
    @tokenGenerator
    def initializeVerifier(keyPath)
      @tokenVerifier=Ssosdk::RSATokenVerifier.new(keyPath)
    end

    def initializeGenerator(keyPath,issuer, tenantId, keyFingerPrint=nil )
      if keyPath.nil?
        raise("private key must be set")
      end
      @tokenGenerator = Ssosdk::RSATokenGenerator.new(keyPath, issuer, tenantId, keyFingerPrint)
      @tenantId=tenantId
    end

    def generateToken(claims)
      token=@tokenGenerator.generate(claims)
      token
    end

    def generateIDPRedirectUrl(claims)
      Ssosdk::YufuTokenConstants::IDP_TOKEN_CONSUME_URL + "?idp_token=" + generateToken(claims)
    end

    def verifyToken(token)
      payload, header=@tokenVerifier.verify(token)
      [payload, header]
    end
  end
end