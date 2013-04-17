require "russianpost/client"
require "russianpost/operations_factory"

module RussianPost
  class Parcel
    attr_reader :barcode, :client

    def initialize(barcode, client: Client)
      @barcode = barcode
      @client  = client.new
    end

    def operations
      @operations ||= fetch_operations
    end

    private

    def fetch_operations
      OperationsFactory.build(client.call(barcode: barcode))
    end
  end
end
