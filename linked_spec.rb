require "rspec"
require_relative "linked"

RSpec.describe LinkedList do
  subject(:list) { described_class.new }

  describe "#append" do
    context "when adding a values" do
      let(:item) { 1 }

      it do
        expect(list.append(item).value).to eq(item)
      end
    end
  end

  describe "#prepend" do
    context "when prepending new item" do
      let(:item) { 2 }

      it do
        expect(list.prepend(item).value).to eq(item)
      end
    end
  end

  describe "#index" do
    context "when return the value from index given" do
      before do
        (1..10).each do |i|
          list.append(i)
        end
      end

      it do
        expect(list.index(5)).to eq(6)
      end
    end
  end

  describe "#size" do
    context "when return the size of list" do
      let(:items) { (1..10).to_a }

      before do
        items.each do |i|
          list.append(i)
        end
      end

      it do
        expect(list.size).to eq(items.size)
      end
    end

    context "when no values are on the list" do
      it "returns 0" do
        expect(list.size).to eq(0)
      end
    end
  end

  describe "#reverse" do
    context "when the list has items" do
      let(:items) { (1..10).to_a }

      before do
        items.each do |i|
          list.append(i)
        end
      end

      it "return the list reverted" do
        expect(list.reverse.value).to eq(list.last.value)
      end

      it "does not modify the list after the reverse" do
        list.reverse
        expect(list.values).to eq(items)
      end
    end

    context "when the list is empty" do
      it "return nil" do
        expect(list.reverse).to eq(nil)
      end
    end
  end

  describe "#reverse!" do
    context "when the list has items" do
      let(:items) { (1..10).to_a }

      before do
        items.each do |i|
          list.append(i)
        end
      end

      it "modify the order list" do
        expect(list.values).to eq(items)
        list.reverse!
        expect(list.values).not_to eq(items)
      end
    end

    context "when the list is empty" do
      it "return nil" do
        expect(list.reverse!).to eq(nil)
      end
    end
  end

  describe "#values" do
    context "when return empty array when there is not values" do
      it do
        expect(list.values).to eq([])
      end
    end

    context "when return an array with values" do
      let(:items) { (1..10).to_a }

      before do
        items.each do |i|
          list.append(i)
        end
      end

      it do
        expect(list.values).to eq(items)
      end
    end
  end

  describe "#search" do
    let(:items) { (1..10).to_a }

    before do
      items.each do |i|
        list.append(i)
      end
    end

    context "when the value is found" do
      it "return the found value" do
        expect(list.search(4)).to eq(4)
      end

      it "found the first item" do
        expect(list.search(1)).to eq(1)
      end

      it "found the last item" do
        expect(list.search(10)).to eq(10)
      end
    end

    context "when not found" do
      it "returs nil" do
        expect(list.search(11)).to be_nil
      end
    end
  end

  describe "#reverse!" do
    let(:items) { (1..10).to_a }

    before do
      items.each do |i|
        list.append(i)
      end
    end

    context "when there is values" do
      before { list.reverse! }

      it "returns a reverse dist" do
        expect(list.values).to eq(items.reverse)
      end
    end
  end

  describe "#delete_head" do
    context "when the list is full" do
      let(:items) { (1..10).to_a }

      before do
        items.each do |i|
          list.append(i)
        end
      end

      it "returns the deleted item" do
        expect(list.delete_head).to eq(items.first)
      end
    end

    context "when the list is empty" do
      it "returns nil" do
        expect(list.delete_head).to be_nil
      end
    end
  end

  describe "#delete_last" do
    context "when the list is full" do
      let(:items) { (1..10).to_a }

      before do
        items.each do |i|
          list.append(i)
        end
      end

      it "returns the last value deleted" do
        expect(list.delete_last).to eq(items.last)
      end

      it "verifies the item is not on the list" do
        list.delete_last

        expect(list.values).to eq(items[0..8])
      end
    end

    context "when the list is empty" do
      it "returns nil" do
        expect(list.delete_last).to be_nil
      end
    end
  end

  describe "#delete_by_value" do
    context "when the list is empty" do
      it "returns nil" do
        expect(list.delete_by_value(1)).to be_nil
      end
    end

    context "when the list is full" do
      let(:items) { (1..10).to_a }

      before do
        items.each do |i|
          list.append(i)
        end
      end

      it "deletes the item" do
        expect(list.values).to eq(items)
        expect(list.delete_by_value(5)).to eq(5)
        expect(list.search(5)).to eq(nil)
      end

      it "return nil if value not found" do
        expect(list.values).to eq(items)
        expect(list.delete_by_value(50)).to eq(nil)
      end
    end
  end

  describe "#delete_by_index" do
    context "when the list is empty" do
      it "return nil" do
        expect(list.delete_by_index(1)).to be_nil
      end
    end

    context "when the list is full" do
      let(:items) { (1..10).to_a }

      before do
        items.each do |i|
          list.append(i)
        end
      end

      it "deletes the first item" do
        expect(list.delete_by_index(0)).to eq(1)
        expect(list.search(1)).to eq(nil)
      end

      it "returns the value from the deleted index" do
        expect(list.values).to eq(items)
        expect(list.delete_by_index(4)).to eq(5)
        expect(list.search(5)).to eq(nil)
      end

      it "return nil if index not found" do
        expect(list.delete_by_index(20)).to be_nil
      end
    end
  end

  describe "#clear" do
    context "when the list is empty" do
      it "returns nil" do
        expect(list.clear).to be_nil
      end
    end

    context "when the list has data" do
      let(:items) { (1..10).to_a }

      before do
        items.each do |i|
          list.append(i)
        end
      end

      it "should return nil" do
        expect(list.clear).to be_nil
      end
    end
  end
end
