import React from 'react'; 
import {KeyboardView, Title,Container,Input,ButtonSubmit,TextSubmit} from './styles';  
import Header from '../../componets/Header';
/*
import { Container } from '../../componets/Header/styles';
import { Button } from 'react-native';
*/
function Signin(){
    return(
        <KeyboardView>
            <Header/>
            <Container>
            <Title>Página de Login</Title>
            <Input
            placeholderTextColor = "#fff"
            placeholder = "E-mail"
            onChangeText={text=>setEmail(text)}
            />
            <Input
            placeholderTextColor = "#fff"
            placeholder = "Senha"
            /* onChangeText={text=>setSenha(text)} */
            secureTextEntry
            />
            <ButtonSubmit>
             <TextSubmit>Entrar</TextSubmit>
            </ButtonSubmit>
            </Container>
        </KeyboardView>
        




    )
}

export default Signin;