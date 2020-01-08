# Clase que representa a una lista doblemente enlazada
# @author Luciana Varela <alu0101106175@ull.edu.es>
class Lista

	include Enumerable
	
	attr_reader :head, :tail, :largo

	# Crea una instancia de Lista
	# @return [Lista] Objeto de la clase Lista
	# @example Crear un objeto de la clase Lista
	# 			@lista = Lista.new()
	def initialize
		@head = nil
		@tail = nil
		@largo = 0
	end

	# Insertar un elemento en la cola de la lista
	# @param valor Valor que queremos añadir a nuestra lista
	# @note Modifica la lista añadiéndole un nuevo nodo
	# @return [nil]
	def insertar(valor)
		nodo = Node.new(valor,nil,nil)
		
		unless @head
			@head = nodo
		else
			nodo.prev = @tail
			@tail.next = nodo
		end
		@tail = nodo
		@largo += 1
	end

	#Extraer cabeza de la lista
	# @return [nil]
	def extraerHead
		auxHead = @head
		@head = auxHead.next
		@largo -=1
	end

	#Extraer cola de la lista
	# @return [nil]
	def extraerTail
		auxTail = @tail
		@tail = auxTail.prev
		@largo -= 1
	end
	
	# Mostrar la Lista formateada
	# @return [nil]
	def to_s

		if @head == nil
			puts "empty"
		else
			puts "[ "
			actual = @head
			while actual != nil
				actual.to_s
				actual = actual.next
			end
		end
		puts " ]"
	end

	# Para poder utilizar el módulo Enumerable
	# @return [Node] Cada elemento de la lista
	def each
		return nil unless block_given?

		current = @head
		while current
			yield current
			current = current.next
		end
	end

	# Sobrecarga del operador [] para poder acceder a un elemento de la misma
	# @param posicion Posición a la que queremos acceder
	# @return [Node] Nodo que se encuentra en esa posición
	def [](posicion)
		actual = @head
		i = 0
		while actual
			if i == posicion
				adevolver = actual
				actual = actual.next
			else
				actual = actual.next
				i += i
			end
		end
		return adevolver.value
	end
end
