#Clase Nodo para una Lista
# @author Luciana Varela <alu0101106175@ull.edu.es>
Node = Struct.new(:value, :next, :prev) do

# Muestra el valor del nodo por pantalla
# @return [nil]	
def to_s
   puts	value.to_s
end

# Para poder utilizar la clase comparable
# @param other Otra instancia de un Nodo para comparar sus valores
# @return [Boolean]	
def <=>(other)
	if other == nil
		return nil
	else
		value <=> other.value
	end
end

end
