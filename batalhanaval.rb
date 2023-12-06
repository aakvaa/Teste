class BatalhaNaval
  def initialize(tamanho)
    @tamanho = tamanho
    @tabuleiro = Array.new(tamanho) { Array.new(tamanho, 'O') }
    @navios = 3
    posicionar_navios
  end

  def posicionar_navios
    @navios.times do
      x = rand(@tamanho)
      y = rand(@tamanho)
      while @tabuleiro[x][y] == 'X'
        x = rand(@tamanho)
        y = rand(@tamanho)
      end
      @tabuleiro[x][y] = 'X'
    end
  end

  def atirar(x, y)
    if @tabuleiro[x][y] == 'X'
      @tabuleiro[x][y] = 'H'
      @navios -= 1
      puts 'Você acertou um navio!'
    else
      puts 'Tiro na água!'
    end
  end

  def imprimir_tabuleiro
    @tabuleiro.each { |row| puts row.join(' ') }
  end

  def jogo_acabou?
    @navios.zero?
  end
end

# Exemplo de uso do jogo
tamanho_tabuleiro = 5
jogo = BatalhaNaval.new(tamanho_tabuleiro)

while !jogo.jogo_acabou?
  jogo.imprimir_tabuleiro
  puts 'Digite a coordenada X para atirar:'
  x = gets.chomp.to_i
  puts 'Digite a coordenada Y para atirar:'
  y = gets.chomp.to_i

  jogo.atirar(x, y)
end

puts 'Parabéns! Você afundou todos os navios!'
