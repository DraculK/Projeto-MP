import React, { useState, useEffect } from 'react'; 
import {KeyboardView, Title,Container,Input,ButtonSubmit,TextSubmit} from './styles';  
import Header from '../../componets/Header';
import {api} from '../../services/api';
import axios from 'axios';
/*
import { Container } from '../../componets/Header/styles';
import { Button } from 'react-native';
*/
function Signin(){
    const [email, setEmail] = useState([]);
    const [senha, setSenha] = useState([]);
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
            onChangeText={text=>setSenha(text)}
            secureTextEntry
            />
            <ButtonSubmit>
                <div onClick={() => {api.post('sign_in', {email: email, password: senha})
                                                .then(response => console.log(response))}}>
                {/* <button onClick={() => {api.get('quizzes/index')
                                            .then(response => console.log(response))}}> */}
                <TextSubmit>Entrar</TextSubmit>
                </div>
            </ButtonSubmit>
            </Container>
        </KeyboardView>
    )
}

export default Signin;