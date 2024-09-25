package com.medic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.medic.interfaces.EspecialidadeInterface;
import com.medic.model.Especialidade;
import com.medic.service.ConnectionFactory;

public class EspecialidadeDAO implements EspecialidadeInterface{

    /*esse atributo ta guardando a conexão com o bd*/
    private Connection connection;

    /*Cria a conexão com o bd encapsulando a logica de criação de conexões, pois o tipo da classe tem os metodos de conexão */
    private ConnectionFactory connectionFactory = new ConnectionFactory();


    /*Esse construtor padrão faz q vc obtenha uma conexão, se a classe driver não for encontrada, vai lançar uma exception */
    public EspecialidadeDAO(){
        try{
            connection = connectionFactory.getConexao();
        }catch(ClassNotFoundException e){
            System.out.println("[Erro ao retornar conexão: "+e.getMessage()+"]");
        }
    }

    @Override
    public void inserirEspecialidade(Especialidade especialidade) {

        /*esta utilizando de uma varivel string para receber o codigo sql que vai inserir o nome na tabela, a interrogação vai ser substituida pelo valor no momento da execução */
        String sql = "INSERT INTO ESPECIALIDADE (NOME) VALUES (?)";
        
        if (connection == null) {
            System.out.println("[Erro] A conexão é null.");
            return; // Ou lance uma exceção
        }
        
        

        /*PreparedStatement é um tipo de classe usada para criar e executar codigos sql a partir de parametros*/
        try {
            
            connection = connectionFactory.getConexao();

            /*permite que voce crie uma query com parametros dinamicos (tipo o "?" no sql), para previnir ataques de sql injection*/
            PreparedStatement ps = connection.prepareStatement(sql);

            /*Substitui o primeiro "?" da query pelo o nome da especialidade que voce esta inserindo // o setString é usado pq o tipo do nome da especialidade é String */
            ps.setString(1, especialidade.getNome());

            /*executa a query preparada, inserindo o valor no banco*/
            ps.execute();

            /*se ouver algum erro no processo, vai jogar uma exception exibindo a msg abaixo*/
        } catch (Exception e) {
            System.out.println("[Erro em inserir Especialidade no Banco: "+e.getMessage()+"]");
        }
    }



    @Override /*to pegando o jeito da coisa */
	    public Especialidade consultarEspecialidade(int IdEspecialidade) {
	        String sql = "SELECT * FROM ESPECIALIDADE WHERE idEspecialidade = ?";
	        Especialidade especialidade = null;
	       
	
	        try {
	            PreparedStatement ps = connection.prepareStatement(sql);
	
	            /*passando o id da especialidade diretamente */
	            ps.setInt(1, IdEspecialidade);
	
	            /*usando o Result set para receber os resultados */
	            ResultSet rs = ps.executeQuery();
	
	            /*porecessando o objeto de resultset pra ler os resultados */
	            if (rs.next()) {
	
	                /*consultando os dados de uma tabela e inserindo em uma variavel de mesmo nome na tabela */
	                int id = rs.getInt("idEspecialidade");
	                String nome = rs.getString("NOME");
	                /*printando os dados recebidos */
	                
	                especialidade = new Especialidade(id, nome);
	                
	            }
	            
	            /*caso tudo de errado vai lançar uma exception */;
	        } catch (Exception e) {
	            System.out.println("[Erro ao consultar especialidade: "+e.getMessage()+"]");
	        }
	        return especialidade;


    }

    @Override
    public void editarEspecialidade(Especialidade especialidade) {
        String sql = "UPDATE ESPECIALIDADE SET NOME = ? WHERE idEspecialidade = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            /*definindo um novo nome*/
            ps.setString(1, especialidade.getNome());

            /*obtendo o id do objeto que vai ser atualizado */
            ps.setInt(2, especialidade.getId());

            /*executa a atualização*/
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("[Erro ao editar especialidade: "+e.getMessage()+"]");
        }

    }

    @Override
    public void excluirEspecialidade(int IdEspecialidade) {
        String sql = "DELETE FROM ESPECIALIDADE WHERE idEspecialidade = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, IdEspecialidade);

            /*executa a exclusão, pois preciso lembrar que ps esta recebendo todo o codigo sql da variavel sql a partir de parametros, ou seja, se executar o ps, executara o codigo sql acima */
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("[Erro ao excluir especialidade: "+e.getMessage()+"]");
        }
    }

    @Override
    public List<Especialidade> listarEspecialidade() {
        List<Especialidade> especialidades = new ArrayList<>();
        String sql = "SELECT * FROM ESPECIALIDADE;";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            /*Executa a consulta e retorna um resultSet */
            ResultSet rs = ps.executeQuery();

            /* processa o objeto de Resultset pra ler os dados*/
            while(rs.next()){

                /*cria um objeto do tipo especialidade */
                Especialidade especialidade = new Especialidade();

                /*fazendo o objeto especialidade consultar uma coluna de uma tabela, fazendo o receber as informações que estão presentes nas colunas da tabela*/
                especialidade.setId(rs.getInt("idEspecialidade"));
                especialidade.setNome(rs.getString("NOME"));

                /* adicionando o onjeto a lista*/
                especialidades.add(especialidade);

            }
        } catch (Exception e) {
            System.out.println("[Erro ao listar especialidade: "+e.getMessage()+"]");
        }
        return especialidades;
    }

}
