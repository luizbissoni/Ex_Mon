defmodule ExMon.GameTest do
  use ExUnit.Case

  alias ExMon.{Game, Player}

  describe "start/2" do
    test "starts the game status" do
      player = Player.build("Test_player", :soco, :chute, :cura)
      computer = Player.build("Test_computer", :soco, :chute, :cura)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns the current game state" do
      player = Player.build("Test_player", :soco, :chute, :cura)
      computer = Player.build("Test_computer", :soco, :chute, :cura)

      Game.start(computer, player)

      expected = %{
        computer: %ExMon.Player{
          life: 100,
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "Test_computer"
        },
        player: %ExMon.Player{
          life: 100,
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "Test_player"
        },
        status: :started,
        turn: :player
      }

      assert expected == Game.info()
    end
  end

  describe "update/1" do
    test "returns the game state updated" do
      player = Player.build("Test_player", :soco, :chute, :cura)
      computer = Player.build("Test_computer", :soco, :chute, :cura)

      Game.start(computer, player)

      game_info = %{
        computer: %ExMon.Player{
          life: 100,
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "Test_computer"
        },
        player: %ExMon.Player{
          life: 100,
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "Test_player"
        },
        status: :started,
        turn: :player
      }

      assert game_info == Game.info()

      new_state = %{
        computer: %ExMon.Player{
          life: 85,
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "Test_computer"
        },
        player: %ExMon.Player{
          life: 34,
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "Test_player"
        },
        status: :started,
        turn: :player
      }

      Game.update(new_state)

      expected = %{new_state | turn: :computer, status: :continue}

      assert expected == Game.info()
    end
  end

end
