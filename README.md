# ExMon

## Jogo baseado em turnos player VS computador em Elixir

#### Iniciando o projeto
1. iex -S mix

#### Criando o jogador (Nome, ataque 1, ... 2, cura)
2. player = ExMon.create_player("Luiz", :chute, :soco, :cura)

#### Inicia o game passando o jogador
3. ExMon.start_game(player)

#### Inicia um movimento de ataque ou cura
4. ExMon.make_move(:soco)

#### Informações do jogador, computador, status do jogo e turno
5. ExMon.Game.info()

...
