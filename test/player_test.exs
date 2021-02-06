defmodule Exmon.PlayerTest do
  use ExUnit.Case

  alias ExMon.Player

  describe "build/4" do
    test "valid player" do
      expected = %Player{
        life: 100,
        moves: %{
          move_avg: :chute,
          move_heal: :cura,
          move_rnd: :soco
        },
        name: "Test_player"
      }
       assert expected == Player.build("Test_player", :soco, :chute, :cura)
    end
  end
end
