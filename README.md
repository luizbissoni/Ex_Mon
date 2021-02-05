# ExMon

Jogo em elixir baseado em turnos player VS computador

Iniciando o projeto
iex -S mix

Criando o jogador
player = ExMon.create_player("Luiz", :chute, :soco, :cura)

Inicia o game passando o jogador
ExMon.start_game(player)

...
