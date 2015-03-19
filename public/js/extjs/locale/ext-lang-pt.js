/*
This file is part of Ext JS 4.2

Copyright (c) 2011-2013 Sencha Inc

Contact:  http://www.sencha.com/contact

GNU General Public License Usage
This file may be used under the terms of the GNU General Public License version 3.0 as
published by the Free Software Foundation and appearing in the file LICENSE included in the
packaging of this file.

Please review the following information to ensure the GNU General Public License version 3.0
requirements will be met: http://www.gnu.org/copyleft/gpl.html.

If you are unsure which license is appropriate for your use, please contact the sales department
at http://www.sencha.com/contact.

Build date: 2013-03-11 22:33:40 (aed16176e68b5e8aa1433452b12805c0ad913836)
*/
/**
 * Portuguese/Brazil Translation by Weber Souza
 * 08 April 2007
 * Updated by Allan Brazute Alves (EthraZa)
 * 06 September 2007
 * Adapted to European Portuguese by Helder Batista (hbatista)
 * 31 January 2008
 */
Ext.onReady(function() {
    var cm = Ext.ClassManager,
        exists = Ext.Function.bind(cm.get, cm);

    if (Ext.Updater) {
        Ext.Updater.defaults.indicatorText = '<div class="loading-indicator">Carregando...</div>';
    }

    if (Ext.Date) {
        Ext.Date.monthNames = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];

        Ext.Date.monthNumbers = {
            Jan: 0,
            Fev: 1,
            Mar: 2,
            Abr: 3,
            Mai: 4,
            Jun: 5,
            Jul: 6,
            Ago: 7,
            Set: 8,
            Out: 9,
            Nov: 10,
            Dez: 11
        };

        Ext.Date.getMonthNumber = function(name) {
            return Ext.Date.monthNumbers[name.substring(0, 1).toUpperCase() + name.substring(1, 3).toLowerCase()];
        };

        Ext.Date.dayNames = ["Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "S&aacute;bado"];
    }
    if (Ext.MessageBox) {
        Ext.MessageBox.buttonText = {
            ok: "OK",
            cancel: "Cancelar",
            yes: "Sim",
            no: "N&atilde;o"
        };
    }

    if (exists('Ext.util.Format')) {
        Ext.apply(Ext.util.Format, {
            thousandSeparator: '.',
            decimalSeparator: ',',
            currencySign: '\u20ac',
            // Portugese Euro
            dateFormat: 'd/m/Y'
        });
    }

    if (exists('Ext.form.field.VTypes')) {
        Ext.apply(Ext.form.field.VTypes, {
            emailText: 'Este campo deve ser um endere&ccedil;o de e-mail v&aacute;lido, no formato "utilizador@dominio.com"',
            urlText: 'Este campo deve ser um URL no formato "http:/' + '/www.dominio.com"',
            alphaText: 'Este campo deve conter apenas letras e _',
            alphanumText: 'Este campo deve conter apenas letras, n&uacute;meros e _'
        });
    }
});

Ext.define("Ext.locale.pt.view.View", {
    override: "Ext.view.View",
    emptyText: ""
});

Ext.define("Ext.locale.pt.grid.plugin.DragDrop", {
    override: "Ext.grid.plugin.DragDrop",
    dragText: "{0} linha(s) seleccionada(s)"
});

Ext.define("Ext.locale.pt.TabPanelItem", {
    override: "Ext.TabPanelItem",
    closeText: "Fechar"
});

Ext.define("Ext.locale.pt.form.field.Base", {
    override: "Ext.form.field.Base",
    invalidText: "O valor para este campo &eacute; inv&aacute;lido"
});

// changing the msg text below will affect the LoadMask
Ext.define("Ext.locale.pt.view.AbstractView", {
    override: "Ext.view.AbstractView",
    msg: "Carregando..."
});

Ext.define("Ext.locale.pt.picker.Date", {
    override: "Ext.picker.Date",
    todayText: "Hoje",
    minText: "Esta data &eacute; anterior &agrave; menor data",
    maxText: "Esta data &eacute; posterior &agrave; maior data",
    disabledDaysText: "",
    disabledDatesText: "",
    monthNames: Ext.Date.monthNames,
    dayNames: Ext.Date.dayNames,
    nextText: 'Pr&oacute;ximo M&ecirc;s (Control+Direita)',
    prevText: 'M&ecirc;s Anterior (Control+Esquerda)',
    monthYearText: 'Escolha um M&ecirc;s (Control+Cima/Baixo para mover entre os anos)',
    todayTip: "{0} (Espa&ccedil;o)",
    format: "d/m/Y",
    startDay: 0
});

Ext.define("Ext.locale.pt.picker.Month", {
    override: "Ext.picker.Month",
    okText: "&#160;OK&#160;",
    cancelText: "Cancelar"
});

Ext.define("Ext.locale.pt.toolbar.Paging", {
    override: "Ext.PagingToolbar",
    beforePageText: "P&aacute;gina",
    afterPageText: "de {0}",
    firstText: "Primeira P&aacute;gina",
    prevText: "P&aacute;gina Anterior",
    nextText: "Pr&oacute;xima P&aacute;gina",
    lastText: "&Uacute;ltima P&aacute;gina",
    refreshText: "Atualizar",
    displayMsg: "<b>{0} &agrave; {1} de {2} registo(s)</b>",
    emptyMsg: 'Sem registos para exibir'
});

Ext.define("Ext.locale.pt.form.field.Text", {
    override: "Ext.form.field.Text",
    minLengthText: "O tamanho m&iacute;nimo para este campo &eacute; {0}",
    maxLengthText: "O tamanho m&aacute;ximo para este campo &eacute; {0}",
    blankText: "Este campo &eacute; obrigat&oacute;rio.",
    regexText: "",
    emptyText: null
});

Ext.define("Ext.locale.pt.form.field.Number", {
    override: "Ext.form.field.Number",
    minText: "O valor m&iacute;nimo para este campo &eacute; {0}",
    maxText: "O valor m&aacute;ximo para este campo &eacute; {0}",
    nanText: "{0} n&atilde;o &eacute; um n&uacute;mero v&aacute;lido"
});

Ext.define("Ext.locale.pt.form.field.Date", {
    override: "Ext.form.field.Date",
    disabledDaysText: "Desabilitado",
    disabledDatesText: "Desabilitado",
    minText: "A data deste campo deve ser posterior a {0}",
    maxText: "A data deste campo deve ser anterior a {0}",
    invalidText: "{0} n&atilde;o &eacute; uma data v&aacute;lida - deve ser usado o formato {1}",
    format: "d/m/Y"
});

Ext.define("Ext.locale.pt.form.field.ComboBox", {
    override: "Ext.form.field.ComboBox",
    valueNotFoundText: undefined
}, function() {
    Ext.apply(Ext.form.field.ComboBox.prototype.defaultListConfig, {
        loadingText: "Carregando..."
    });
});

Ext.define("Ext.locale.pt.form.field.HtmlEditor", {
    override: "Ext.form.field.HtmlEditor",
    createLinkText: 'Por favor, entre com o URL do link:'
}, function() {
    Ext.apply(Ext.form.field.HtmlEditor.prototype, {
        buttonTips: {
            bold: {
                title: 'Negrito (Ctrl+B)',
                text: 'Deixa o texto seleccionado em negrito.',
                cls: Ext.baseCSSPrefix + 'html-editor-tip'
            },
            italic: {
                title: 'Italico (Ctrl+I)',
                text: 'Deixa o texto seleccionado em italico.',
                cls: Ext.baseCSSPrefix + 'html-editor-tip'
            },
            underline: {
                title: 'Sublinhado (Ctrl+U)',
                text: 'Sublinha o texto seleccionado.',
                cls: Ext.baseCSSPrefix + 'html-editor-tip'
            },
            increasefontsize: {
                title: 'Aumentar Texto',
                text: 'Aumenta o tamanho da fonte.',
                cls: Ext.baseCSSPrefix + 'html-editor-tip'
            },
            decreasefontsize: {
                title: 'Diminuir Texto',
                text: 'Diminui o tamanho da fonte.',
                cls: Ext.baseCSSPrefix + 'html-editor-tip'
            },
            backcolor: {
                title: 'Cor de Fundo',
                text: 'Muda a cor do fundo do texto seleccionado.',
                cls: Ext.baseCSSPrefix + 'html-editor-tip'
            },
            forecolor: {
                title: 'Cor da Fonte',
                text: 'Muda a cor do texto seleccionado.',
                cls: Ext.baseCSSPrefix + 'html-editor-tip'
            },
            justifyleft: {
                title: 'Alinhar &agrave; Esquerda',
                text: 'Alinha o texto &agrave; esquerda.',
                cls: Ext.baseCSSPrefix + 'html-editor-tip'
            },
            justifycenter: {
                title: 'Centrar Texto',
                text: 'Centra o texto no editor.',
                cls: Ext.baseCSSPrefix + 'html-editor-tip'
            },
            justifyright: {
                title: 'Alinhar &agrave; Direita',
                text: 'Alinha o texto &agrave; direita.',
                cls: Ext.baseCSSPrefix + 'html-editor-tip'
            },
            insertunorderedlist: {
                title: 'Lista com Marcadores',
                text: 'Inicia uma lista com marcadores.',
                cls: Ext.baseCSSPrefix + 'html-editor-tip'
            },
            insertorderedlist: {
                title: 'Lista Numerada',
                text: 'Inicia uma lista numerada.',
                cls: Ext.baseCSSPrefix + 'html-editor-tip'
            },
            createlink: {
                title: 'Hyperliga&ccedil;&atilde;o',
                text: 'Transforma o texto selecionado num hyperlink.',
                cls: Ext.baseCSSPrefix + 'html-editor-tip'
            },
            sourceedit: {
                title: 'Editar Fonte',
                text: 'Troca para o modo de edi&ccedil;&atilde;o de c&oacute;digo fonte.',
                cls: Ext.baseCSSPrefix + 'html-editor-tip'
            }
        }
    });
});

Ext.define("Ext.locale.pt.grid.header.Container", {
    override: "Ext.grid.header.Container",
    sortAscText: "Ordem Ascendente",
    sortDescText: "Ordem Descendente",
    lockText: "Bloquear Coluna",
    unlockText: "Desbloquear Coluna",
    columnsText: "Colunas"
});

Ext.define("Ext.locale.pt.grid.PropertyColumnModel", {
    override: "Ext.grid.PropertyColumnModel",
    nameText: "Nome",
    valueText: "Valor",
    dateFormat: "d/m/Y"
});

// This is needed until we can refactor all of the locales into individual files
Ext.define("Ext.locale.pt.Component", {	
    override: "Ext.Component"
});

