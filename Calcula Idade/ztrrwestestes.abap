*----------------------------------------------------------------------*
*                         PRATICANDO                                   *
*----------------------------------------------------------------------*
* Autor....: Wesley Constantino dos Santos                             *
* Data.....: 28.12.2022                                                *
* Módulo...: TR                                                        *
* Descrição: Testes                                                    *
*----------------------------------------------------------------------*
*                    Histórico das Alterações                          *
*----------------------------------------------------------------------*
* DATA      | AUTOR             | Request    | DESCRIÇÃO               *
*----------------------------------------------------------------------*
*           |                   |            |                         *
*----------------------------------------------------------------------*
REPORT ztrrwestestes.

*&---------------------------------------------------------------------*
*                       Variáveis globais                              *
*&---------------------------------------------------------------------*
DATA: vg_idade    TYPE i,
      vg_sexo     TYPE c LENGTH 1,
      vg_nome(50) TYPE c.

*&---------------------------------------------------------------------*
*                          Tela de seleção                             *
*&---------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-t01.
*Campos de entrada
"PARAMETERS:
PARAMETERS: p_sexo     TYPE c LENGTH 1 OBLIGATORY,
            p_nome(50) TYPE c OBLIGATORY,
            p_nasci    TYPE i OBLIGATORY,
            p_ano      TYPE i OBLIGATORY.

SELECTION-SCREEN END OF BLOCK b1.

*Início da lógica
START-OF-SELECTION.
  PERFORM: zf_calcula_idade,
           zf_popula_t_saida,
           zf_saida.

*&---------------------------------------------------------------------*
*&      Form  ZF_CALCULA_IDADE
*&---------------------------------------------------------------------*
FORM zf_calcula_idade .

  vg_idade = p_ano - p_nasci.

ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  ZF_POPULA_T_SAIDA
*&---------------------------------------------------------------------*
FORM zf_popula_t_saida .

  vg_sexo = p_sexo.
  vg_nome = p_nome.

ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  ZF_SAIDA
*&---------------------------------------------------------------------*
FORM zf_saida .

  WRITE: 'Seu nome é ',vg_nome,', você tem ',vg_idade,'anos e é do sexo '.
  PERFORM zf_define_sexo.

ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  ZF_DEFINE_SEXO
*&---------------------------------------------------------------------*
FORM zf_define_sexo .

  CASE p_sexo.
    WHEN 'M'.
      WRITE 'masculino'.
    WHEN 'm'.
      WRITE 'masculino'.
    WHEN 'F'.
      WRITE 'feminino'.
    WHEN 'f'.
      WRITE 'feminino'.
  ENDCASE.


ENDFORM.
