# Generated from Grit.g4 by ANTLR 4.13.2
from antlr4 import *
if "." in __name__:
    from .GritParser import GritParser
else:
    from GritParser import GritParser

# This class defines a complete listener for a parse tree produced by GritParser.
class GritListener(ParseTreeListener):

    # Enter a parse tree produced by GritParser#program.
    def enterProgram(self, ctx:GritParser.ProgramContext):
        pass

    # Exit a parse tree produced by GritParser#program.
    def exitProgram(self, ctx:GritParser.ProgramContext):
        pass


    # Enter a parse tree produced by GritParser#statement.
    def enterStatement(self, ctx:GritParser.StatementContext):
        pass

    # Exit a parse tree produced by GritParser#statement.
    def exitStatement(self, ctx:GritParser.StatementContext):
        pass


    # Enter a parse tree produced by GritParser#ifStatement.
    def enterIfStatement(self, ctx:GritParser.IfStatementContext):
        pass

    # Exit a parse tree produced by GritParser#ifStatement.
    def exitIfStatement(self, ctx:GritParser.IfStatementContext):
        pass


    # Enter a parse tree produced by GritParser#whileStatement.
    def enterWhileStatement(self, ctx:GritParser.WhileStatementContext):
        pass

    # Exit a parse tree produced by GritParser#whileStatement.
    def exitWhileStatement(self, ctx:GritParser.WhileStatementContext):
        pass


    # Enter a parse tree produced by GritParser#assignment.
    def enterAssignment(self, ctx:GritParser.AssignmentContext):
        pass

    # Exit a parse tree produced by GritParser#assignment.
    def exitAssignment(self, ctx:GritParser.AssignmentContext):
        pass


    # Enter a parse tree produced by GritParser#expr.
    def enterExpr(self, ctx:GritParser.ExprContext):
        pass

    # Exit a parse tree produced by GritParser#expr.
    def exitExpr(self, ctx:GritParser.ExprContext):
        pass


    # Enter a parse tree produced by GritParser#additiveExpr.
    def enterAdditiveExpr(self, ctx:GritParser.AdditiveExprContext):
        pass

    # Exit a parse tree produced by GritParser#additiveExpr.
    def exitAdditiveExpr(self, ctx:GritParser.AdditiveExprContext):
        pass


    # Enter a parse tree produced by GritParser#term.
    def enterTerm(self, ctx:GritParser.TermContext):
        pass

    # Exit a parse tree produced by GritParser#term.
    def exitTerm(self, ctx:GritParser.TermContext):
        pass


    # Enter a parse tree produced by GritParser#factor.
    def enterFactor(self, ctx:GritParser.FactorContext):
        pass

    # Exit a parse tree produced by GritParser#factor.
    def exitFactor(self, ctx:GritParser.FactorContext):
        pass



del GritParser