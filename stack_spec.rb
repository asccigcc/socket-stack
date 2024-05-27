require "rspec"
require_relative "stack"

RSpec.describe Stack do
  subject(:stack) { described_class.new }

  describe "#push" do
    context "when prepending new item" do
      let(:item) { {a:1, b:2}.to_json }

      it do
        expect(stack.push(item)).to eq(item)
      end
    end
  end

  describe "#size" do
    context "when return the size of stack" do
      let(:items) { (1..10).to_a }

      before do
        items.each do |i|
          stack.push(i)
        end
      end

      it do
        expect(stack.size).to eq(items.size)
      end
    end

    context "when no values are on the stack" do
      it "returns 0" do
        expect(stack.size).to eq(0)
      end
    end
  end

  describe "#to_a" do
    context "when return empty array when there is not values" do
      it do
        expect(stack.to_a).to eq([])
      end
    end

    context "when return an array with values" do
      let(:items) { (1..10).to_a }

      before do
        items.each do |i|
          stack.push(i)
        end
      end

      it do
        expect(stack.to_a).to eq(items.reverse)
      end
    end
  end

  describe "#pop" do
    context "when the stack is full" do
      let(:items) { (1..10).to_a }

      before do
        items.each do |i|
          stack.push(i)
        end
      end

      it "returns the top stack" do
        expect(stack.pop).to eq(items.last)
      end
    end

    context "when the stack is empty" do
      it "returns nil" do
        expect(stack.pop).to be_nil
      end
    end
  end

  describe "#clear" do
    context "when the stack is empty" do
      it "returns nil" do
        expect(stack.clear).to be_nil
      end
    end

    context "when the stack has data" do
      let(:items) { (1..10).to_a }

      before do
        items.each do |i|
          stack.push(i)
        end
      end

      it "should return nil" do
        expect(stack.clear).to be_nil
      end
    end
  end

  describe "#empty?" do
    context "when the stack is empty" do
      it "should return true" do
        expect(stack.empty?).to be true
      end
    end

    context "when the stack has data" do
      let(:items) { (1..10).to_a }

      before do
        items.each do |i|
          stack.push(i)
        end
      end

      it "should  return false" do
        expect(stack.empty?).to be false
      end
    end
  end
end
