defmodule ExMonTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  alias ExMon.Player

  describe "create_player/4" do
    test "returns a player" do
      expected = %Player{
        life: 100,
        moves: %{
          move_avg: :chute,
          move_heal: :cura,
          move_rnd: :soco
        },
        name: "Test_player"
      }

      assert expected == ExMon.create_player("Test_player", :soco, :chute, :cura)
    end
  end

  describe "start_game/1" do
    test "when the game is started, returns a message" do
     player = Player.build("Test_player", :soco, :chute, :cura)

      messages = capture_io(fn -> assert ExMon.start_game(player) == :ok end)

      assert messages =~ "The game is started!"
      assert messages =~ "status: :started"
      assert messages =~ "turn: :player"
    end
  end

  describe "make_move/1" do
    setup do
      player = Player.build("Test_player", :soco, :chute, :cura)

      messages = capture_io(fn ->
        ExMon.start_game(player)
      end)

      :ok
    end

    test "whe the move is valid, do the move and the computer makes a move" do
      messages = capture_io(fn ->
        assert ExMon.make_move(:chute)
      end)

      assert messages =~ "The Player attacked the computer"
      assert messages =~ "It's computer turn."
      assert messages =~ "status: :continue"
    end

    test "when the move is invalid, returns an error message" do
      messages = capture_io(fn ->
        assert ExMon.make_move(:invalido)
      end)

      assert messages =~ "Invalid move: invalido"
    end
  end
end
