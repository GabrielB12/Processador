void guardaReg(void)
{
    // registradores que são usados nos programas
    store(0);
    store(1);
    store(2);
    store(3);
    store(4);
    store(5);
    store(6);
    store(7);
    store(8);
    store(9);
    store(10);
    store(11);
    store(13);
    store(14);
    store(15);
    store(16);
    store(17);
    store(18);
    store(19);
    store(20);
    store(21);
    store(22);
    store(23);
    store(24);
    store(25);
    store(26);
    store(27);
    store(28);
    store(29);
    store(30);
    store(31);
}

void leReg(int pos)
{
    // registradores que são usados nos programas
    load(0, 4);
    load(1, 5);
    load(2, 6);
    load(3, 7);
    load(4, 8);
    load(5, 9);
    load(6, 10);
    load(7, 11);
    load(8, 12);
    load(9, 13);
    load(10, 14);
    load(11, 15);
    load(13, 16);
    load(14, 17);
    load(15, 18);
    load(16, 19);
    load(17, 20);
    load(18, 21);
    load(19, 22);
    load(20, 23);
    load(21, 24);
    load(22, 25);
    load(23, 26);
    load(24, 27);
    load(25, 28);
    load(26, 29);
    load(27, 30);
    load(28, 31);
    load(29, 32);
    load(30, 33);
    load(31, 34);
}

void main(void)
{
    int endAtual;
    int PC[3];
    int TEMP_REG[32];
    // vetor para armazenar todos os possíveis estados de registradores na troca de contexto
    int regVet[100];

    // variaveis auxiliares
    int comeco;
    int preem;
    preem = 0;
    int progAtual;
    int finalizados[3];
    int auxFim;

    int quantum;

    int i;
    int indexVet;
    int posData;
    int qnt;
    int vetPROG[3];

    // serve para informar a posição de cada programa para os saltos
    int posProgramas[3];
    posProgramas[0] = 617;
    posProgramas[1] = 723;
    posProgramas[2] = 771;

    guardaReg(); // Salva os registradores no endereço 10-19 e 25-31

    if (preem == 0) // só entra na primeira vez rodando o so
    {
        escreveLCD(); // Bianchi CPU/SO - 3p/ ir
        limpaLCD();
        int confirma;
        confirma = input();

        if (confirma == 3) // para teste(sem isso não funciona)
        {
            comeco = 1;

            auxFim = 0;
            finalizados[0] = 0;
            finalizados[1] = 0;
            finalizados[2] = 0;

            endAtual = 0; // pc começa em 0
            PC[0] = 0;
            PC[1] = 0;
            PC[2] = 0;

            quantum = 8;

            escreveLCD(); // função feita na mão - 0 sequencial e 1 preempção
            preem = input();
            limpaLCD();

            escreveLCD(); // pergunta a quantidade de programas
            qnt = input();
            limpaLCD();
            while (qnt > 0)
            {
                int index;
                index = 0;
                escreveLCD(); // pergunta qual o programa a ser executado
                vetPROG[index] = input();
                limpaLCD();
                escreveLCD(); // programa X(vetPROG[index]) inserido
                limpaLCD();
                index = index + 1;
                qnt = qnt - 1;
            }

            progAtual = vetPROG[0]; // por onde começa
            progAtual = progAtual - 1;
        }
    }

    escreveLCD(); // iniciando
    limpaLCD();
    if (preem == 0) // é sequencial
    {
        jumpPC(posProgramas[progAtual]); // só vai para a posição do primeiro programa na lista
    }

    else if (preem == 1) // com preempção
    {
        if (comeco == 1)
        {
            comeco = 0;                      // já troca o valor
            ligaQnt(quantum);                // manda o quantum começar
            jumpPC(posProgramas[progAtual]); // vai para a posição do respectivo programa
        }
        else // comeco == 0, então já fez uma vez
        {
            endAtual = retornaEnd_pc();

            if (endAtual == 0)
            {
                auxFim = auxFim + 1; // adiciona 1 na variavel de programas finalizados
                finalizados[progAtual] = 1;
                escreveLCD(); // programa X(progAtual) acabou
                limpaLCD();
            }
            else
            {
                escreveLCD(); // trocando Ctx
                limpaLCD();
                PC[progAtual] = endAtual + 1;
                i = 0;
                posData = progAtual * 32; // onde no vetor de registradores - [0:31] ou [32:63] (...)
                while (i < 32)            // guarda o valor dos 32 registradores
                {
                    regVet[i + posData] = TEMP_REG[i];
                    TEMP_REG[i] = 0;
                    i = i + 1;
                }
            }

            progAtual = progAtual + 1; // avança o programa
            escreveLCD();              // Programa X
            limpaLCD();
            if (progAtual == 3)
            { // para voltar para algum anterior que não tenha acabado
                progAtual = 0;
            }

            if (auxFim == 3) // todos acabaram
            {
                escreveLCD(); // FIM
                preem = 0;
                ligaQnt(0); // zera o quantum, sem mais preempção
                jumpPC(0);  // volta o pc pra 0
            }
            else // não acabou ainda, ainda tem programas para executar
            {
                while (finalizados[progAtual] == 1)
                {
                    progAtual = progAtual + 1; // avança até achar um que não está finalizado
                }
                // verificar se está voltando para a execução de um programa que já começou antes
                if (PC[progAtual] != 0) // já passou por esse programa (preempção)
                {
                    posData = PC[progAtual];   // local para o salto do PC
                    indexVet = 32 * progAtual; // de onde ler os registradores
                    leReg(regVet[indexVet]);
                    jumpPC(posData);
                }
                else
                {
                    jumpPC(posProgramas[progAtual]);
                }
            }
        }
    }
}