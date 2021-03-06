defmodule Auction.FakeRepo do
  alias Auction.Item

  @items [
      %Item{
        id: 1,
        title: "My First Item",
        description: "A tasty item sure to please",
        ends_at: ~N[2022-01-01 00:00:00]
      },
      %Item{
        id: 2,
        title: "Item The Second",
        description: "Blah Blah Blah",
        ends_at: ~N[2022-01-02 00:00:00]
      },
      %Item{
        id: 3,
        title: "Third Item",
        description: "Third times a charm",
        ends_at: ~N[2022-01-03 00:00:00]
      }
  ]

  def all(Item), do: @items

  def get!(Item, id) do
    Enum.find(@items, fn(item) -> item.id === id end)
  end

  def get_by(Item, attrs) do
    Enum.find(@items, fn(item) ->
      Enum.all?(Map.keys(attrs), fn(key) ->
        Map.get(item, key) === attrs[key]
      end)
    end)
  end
end
